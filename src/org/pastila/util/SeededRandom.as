package org.pastila.util
{
	
	/**
	 * @author Ilya Malanin (flashdeveloper[at]pastila.org)
	 */
	final public class SeededRandom
	{
		private static const INT_TO_NUMBER_DIVIDER:Number = 1.0 / int.MAX_VALUE;
		
		private var _seed:int;
		
		private var _seedPart0:int;
		private var _seedPart1:int;
		
		public function SeededRandom(seed:int = 0)
		{
			this.seed = seed;
		}
		
		public function get seed():int
		{
			return _seed;
		}
		
		public function set seed(seed:int):void
		{
			_seed = seed;
			
			_seedPart0 = seed;
			_seedPart1 = computeSeedPart(seed);
		}
		
		public function nextInt():int
		{
			return generateSample();
		}
		
		public function nextNumber():Number
		{
			return nextInt() * INT_TO_NUMBER_DIVIDER;
		}
		
		public function nextIntWithin(from:int, to:int):int
		{
			return from + (int(nextNumber() * (to - from)));
		}
		
		public function intByChance(values:Vector.<int>, chances:Vector.<int>):int
		{
			const length:int = values.length;
			
			var popuplated:Vector.<int> = new <int>[];
			for (var i:int = 0; i < length; i++)
			{
				for (var j:int = 0; j < chances[i]; j++)
				{
					popuplated.push(values[i]);
				}
			}
			
			return popuplated[nextInt() % popuplated.length];
		}
		
		private function computeSeedPart(seed:int):int
		{
			return abs((seed * (((int.MAX_VALUE - (seed ^ 0x00F4B3)) && 0x55B8F3)) ^ 0x4FB0CD) % int.MAX_VALUE);
		}
		
		private function abs(value:int):int
		{
			return value < 0 ? -value : value;
		}
		
		private function generateSample():int
		{
			_seedPart1 = (_seedPart1 * 0x458F2A + _seedPart0) % int.MAX_VALUE;
			_seedPart0 = _seedPart1;
			
			return _seedPart1;
		}
		
		public function nextBoolean():Boolean
		{
			return Boolean(nextInt() % 2);
		}
	
	}
}
