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
package org.apache.royale.html.beads.models
{	
	import org.apache.royale.core.IBead;
	import org.apache.royale.core.IStrand;
	import org.apache.royale.core.IColorSpectrumModel;
	import org.apache.royale.core.IColorModel;
	import org.apache.royale.events.Event;
	import org.apache.royale.events.EventDispatcher;
		
    /**
     *  The ColorSpectrumModel class is the most basic data model for a
     *  component that displays or edits a color spectrum. 
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion Royale 0.9.6
     */
	public class ColorSpectrumModel extends EventDispatcher implements IColorSpectrumModel
	{
		private var _color:uint;
		private var _baseColor:IColorModel;
		private var _hsvModifiedColor:IColorModel;
        /**
         *  Constructor.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.6
         */
		public function ColorSpectrumModel()
		{
		}
		
		public function set strand(value:IStrand):void
		{
		}

        /**
         *  @copy org.apache.royale.core.ISpectrumColorModel#baseColor
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.6
         */
        public function get baseColor():IColorModel
		{
			return _baseColor;
		}
		
        /**
         *  @private
         */
        public function set baseColor(value:IColorModel):void
		{
			_baseColor = value;
		}
        /**
         *  @copy org.apache.royale.core.ISpectrumColorModel#hsvModifiedColor
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.6
         */
        public function get hsvModifiedColor():IColorModel
		{
			return _hsvModifiedColor;
		}
		
        /**
         *  @private
         */
        public function set hsvModifiedColor(value:IColorModel):void
		{
			_hsvModifiedColor = value;
		}
	}
}
