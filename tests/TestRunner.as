package {
	import asunit.core.AsUnitCore;
	import asunit.core.TextCore;

	import flash.display.Sprite;

	/**
	 * @author Ilya Malanin (flashdeveloper[at]pastila.org)
	 */
	public class TestRunner extends Sprite {
		private var core : AsUnitCore;

		public function TestRunner() {
			core = new TextCore();
			core.start(AllTests, null, this);
		}
	}
}
