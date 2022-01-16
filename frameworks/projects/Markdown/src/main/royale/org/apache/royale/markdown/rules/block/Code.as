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
package org.apache.royale.markdown
{
	public class Code extends Rule
	{
		private function Code()
		{
			
		}
		private static var _instance:Code;
		public static function get():Code
		{
			if(!_instance)
				_instance = new Code();
			
			return _instance;
		}

		/**
		 * parses the rule
		 * @langversion 3.0
		 * @productversion Royale 0.9.9		 * 
		 */
		override public function parse(state:IState, silent:Boolean = false, startLine:int = -1, endLine:int = -1):Boolean
		{
			throw new Error("Method not implemented.");
		}

	}
}