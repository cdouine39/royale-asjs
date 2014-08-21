////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.flex.charts.beads
{	
	import org.apache.flex.charts.core.IChart;
	import org.apache.flex.charts.core.IHorizontalAxisBead;
	import org.apache.flex.core.FilledRectangle;
	import org.apache.flex.core.IBead;
	import org.apache.flex.core.IDataProviderItemRendererMapper;
	import org.apache.flex.core.ISelectionModel;
	import org.apache.flex.core.IStrand;
	import org.apache.flex.core.UIBase;
	import org.apache.flex.events.Event;
	import org.apache.flex.events.IEventDispatcher;
	import org.apache.flex.html.Label;
	import org.apache.flex.html.beads.models.ArraySelectionModel;
	
	/**
	 *  The XAxisBead displays a linear value axis horizontally for
	 *  a Cartesian-style chart. 
	 *  
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion FlexJS 0.0
	 */
	public class XAxisBead implements IBead, IHorizontalAxisBead
	{
		/**
		 *  constructor.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function XAxisBead()
		{
		}
		
		private var _axisHeight:Number = 30;
		
		/**
		 *  The height of the horizontal axis.
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function get axisHeight():Number
		{
			return _axisHeight;
		}
		public function set axisHeight(value:Number):void
		{
			_axisHeight = value;
		}
		
		private var _labelField:String;
		
		/**
		 *  The name of field witin the chart data to use to label each of the
		 *  axis data points.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function get labelField():String
		{
			return _labelField;
		}
		public function set labelField(value:String):void
		{
			_labelField = value;
		}
		
		private var _gap:Number = 20;
		
		/**
		 *  The amount of space to leave between series. If a chart has several series,
		 *  the bars for an X value are side by side with a gap between the groups of
		 *  bars.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function get gap():Number
		{
			return _gap;
		}
		public function set gap(value:Number):void
		{
			_gap = value;
		}
		
		private var _strand:IStrand;
		
		/**
		 *  @copy org.apache.flex.core.IBead#strand
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion FlexJS 0.0
		 */
		public function set strand(value:IStrand):void
		{
			_strand = value;
			
			// in order to draw or create the labels, need to know when the series has been created.
			IEventDispatcher(_strand).addEventListener("layoutComplete",handleItemsCreated);
		}
		
		/**
		 * @private
		 */
		private function handleItemsCreated(event:Event):void
		{
			var charter:ChartItemRendererFactory =
				_strand.getBeadByType(IDataProviderItemRendererMapper) as ChartItemRendererFactory;
			
			var model:ArraySelectionModel = _strand.getBeadByType(ISelectionModel) as ArraySelectionModel;
			var items:Array;
			if (model.dataProvider is Array) items = model.dataProvider as Array;
			else return;
			
			var renderers:Array = charter.seriesRenderers;
			var series:Array = IChart(_strand).series;
					
			var xpos:Number = 0;
			var xAxisHeightOffset:Number = axisHeight;
			var useWidth:Number = UIBase(_strand).width / renderers.length;
			
			// draw the horzontal axis
			var horzLine:FilledRectangle = new FilledRectangle();
			horzLine.fillColor = 0x111111;
			horzLine.x = 0;
			horzLine.y = UIBase(_strand).height - xAxisHeightOffset;
			horzLine.height = 1;
			horzLine.width = UIBase(_strand).width;
			UIBase(_strand).addElement(horzLine);
			
			// place the labels below the axis enough to account for the tick marks
			var labelY:Number = UIBase(_strand).height + 8;
			
			for(var i:int=0; i < items.length; i++) {				
				var label:Label = new Label();
				label.text = items[i][labelField];
				label.x = xpos;
				label.y = labelY - xAxisHeightOffset;
				
				UIBase(_strand).addElement(label);
				
				// add a tick mark, too
				var tick:FilledRectangle = new FilledRectangle();
				tick.fillColor = 0x111111;
				tick.x = xpos + useWidth/2 - gap;
				tick.y = UIBase(_strand).height - xAxisHeightOffset;
				tick.width = 1;
				tick.height = 5;
				UIBase(_strand).addElement(tick);
				
				var r:UIBase = UIBase(renderers[i][0]);
				xpos += useWidth;
			}
		}
	}
}
