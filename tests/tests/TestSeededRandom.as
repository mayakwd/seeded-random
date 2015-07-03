package tests {
	import asunit.asserts.assertEquals;
	import asunit.asserts.assertTrue;

	import org.hamcrest.assertThat;
	import org.hamcrest.number.closeTo;
	import org.pastila.maze.util.SeededRandom;

	import flash.utils.getTimer;

	public class TestSeededRandom {
		[Test]
		public function testInt() : void {
			const seed : int = 0x403FF4;

			const randomA : SeededRandom = new SeededRandom(seed);
			const randomB : SeededRandom = new SeededRandom(seed);

			for (var i : int = 0; i < 1000; i++) {
				assertEquals(randomA.nextInt(), randomB.nextInt());
			}
		}

		[Test]
		public function testNumber() : void {
			const seed : int = 0x403FF4;

			const randomA : SeededRandom = new SeededRandom(seed);
			const randomB : SeededRandom = new SeededRandom(seed);

			for (var i : int = 0; i < 1000; i++) {
				assertEquals(randomA.nextNumber(), randomB.nextNumber());
			}
		}

		[Test]
		public function testIntRange() : void {
			const random : SeededRandom = new SeededRandom();

			for (var i : int = 0; i < 1000; i++) {
				random.seed = i;
				for (var j : int = 0; j < 1000; j++) {
					var value : int = random.nextInt();
					assertTrue(value >= 0 && value < int.MAX_VALUE);
				}
			}
		}
		
		[Test]
		public function testIntByChanceDistribution() : void {
			const random : SeededRandom = new SeededRandom(getTimer());
			
			const values : Vector.<int> = new <int>[0, 1, 2];
			const chances : Vector.<int> = new <int>[1, 3, 6];
			
			var result : Vector.<int> = new Vector.<int>(3);
			
			for (var i : int = 0; i < 1000; i++) {
				result[random.intByChance(values, chances)]++;
			}
			
			for (i = 0; i < 3; i++) {
				assertThat(result[i] * 0.01, closeTo(chances[i], 0.5));
			}
		}
	}
}
