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
package org.apache.flex.html.dynamicControls.beads
{
	import flash.display.DisplayObject;
	
	import org.apache.flex.core.IParent;
	import org.apache.flex.core.IStrand;
	import org.apache.flex.events.Event;
	import org.apache.flex.events.IEventDispatcher;
	import org.apache.flex.html.common.beads.SingleLineBorderBead;
	import org.apache.flex.html.common.beads.models.SingleLineBorderModel;
	import org.apache.flex.html.common.supportClasses.Border;

	public class TextInputWithBorderView extends TextInputView
	{
		public function TextInputWithBorderView()
		{
			super();
		}
		
		private var _border:Border;
		
		public function get border():Border
		{
			return _border;
		}
		
		override public function set strand(value:IStrand):void
		{
			super.strand = value;
			
			// add a border to this
			_border = new Border();
			_border.model = new SingleLineBorderModel();
			_border.addBead(new SingleLineBorderBead());
			IParent(strand).addElement(border);
			
			IEventDispatcher(strand).addEventListener("widthChanged", sizeChangedHandler);
			IEventDispatcher(strand).addEventListener("heightChanged", sizeChangedHandler);
			sizeChangedHandler(null);
		}
		
		private function sizeChangedHandler(event:Event):void
		{
			var ww:Number = DisplayObject(strand).width;
			_border.width = ww;
			
			var hh:Number = DisplayObject(strand).height;
			_border.height = hh;
		}
	}
}