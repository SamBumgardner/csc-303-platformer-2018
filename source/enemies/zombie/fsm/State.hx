package enemies.zombie.fsm;

/**
 * @author 
 */
interface State 
{
	public function update():Int;
	public function transitionIn():Void;
	public function transitionOut():Void;
}