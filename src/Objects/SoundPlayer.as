package Objects 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class SoundPlayer extends Sound
	{
		private var sound:Sound = new Sound();
		private var channel:SoundChannel = new SoundChannel();
		
		public function SoundPlayer(toPlay:int = 0)
		{
			if (toPlay == 1)
			{
				sound.load(new URLRequest("lib/gameplay.mp3"));
				channel = sound.play(0,9001,null);
			}
			if (toPlay == 2)
			{
				sound.load(new URLRequest("lib/intro.mp3"));
				channel = sound.play(0,9001,null);
			}
			if (toPlay == 3)
			{
				sound.load(new URLRequest("lib/endscreen.mp3"));
				channel = sound.play(0,9001,null);
			}
		}
		
		public function stop():void
		{
			channel.stop();
		}
	}

}