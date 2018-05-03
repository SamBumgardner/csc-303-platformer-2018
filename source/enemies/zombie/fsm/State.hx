package enemies.zombie.fsm;

/**
 * @author 
 */
interface State 
{
	public function update():Void;
	public function transitionIn():Void;
	public function transitionOut():Void;
}