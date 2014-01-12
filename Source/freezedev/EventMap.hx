package freezedev;
import haxe.Timer;

/**
 * ...
 * @author Johannes Stein
 * This is public domain
 */

class GenericEventMap<T, R>
{
  private var beforeMap: Map < String, Array < T -> R >>;
	private var nowMap: Map < String, Array < T -> R >> ;
  private var afterMap: Map < String, Array < T -> R >>;
  
  /**
   * 
   * @param map
   * @param Array < T -> R >>
   * @param eventName
   * @param fn
   */
  private function addToMap(map: Map < String, Array < T -> R >>, eventName, fn: T -> R) {
    if (map.exists(eventName)) {
			var value = map.get(eventName);
			value.push(fn);
			map.set(eventName, value);
		} else {
			var arr = new Array<T -> R>();
			arr.push(fn);
			map.set(eventName, arr);
		}
  }
 
  /**
   * 
   */
	public function new() {
		beforeMap = new Map < String, Array < T -> R >> ();
		nowMap = new Map < String, Array < T -> R >> ();
		afterMap = new Map < String, Array < T -> R >> ();
	}
	
  /**
   * 
   * 
   * @param eventName
   * @param fn
   */
  public function before(eventName: String, fn: T -> R) {
    addToMap(beforeMap, eventName, fn);
  }
  
  /**
   * 
   * @param eventName
   * @param fn
   */
  public function after(eventName: String, fn: T -> R) {
    addToMap(afterMap, eventName, fn);
  }
  
  /**
   * 
   * @param eventName
   * @param fn
   */
	public function on(eventName: String, fn: T -> R) {
    addToMap(nowMap, eventName, fn);
	}
	
  /**
   * 
   * @param eventName
   */
	public function off(eventName: String) {
		if (nowMap.exists(eventName)) {
			nowMap.remove(eventName);
		}
	}
	
  /**
   * 
   * @param eventName
   * @param ?args
   */
	public function trigger(eventName: String, ?args: T) {
		if (nowMap.exists(eventName)) {
      if (beforeMap.exists(eventName)) {
        var valBefore = beforeMap.get(eventName);
        for (i in valBefore) {
          i.bind(args)();
        }
      }
      
      // All events in now
			var valNow = nowMap.get(eventName);
			for (j in valNow) {
				j.bind(args)();
			}
      
      if (afterMap.exists(eventName)) {
        var valAfter = afterMap.get(eventName);
        for (i in valAfter) {
          i.bind(args)();
        }
      }
		}
	}
  
  /**
   * 
   * @param eventName
   * @param delay
   * @param ?args
   */
  public function triggerDelay(eventName: String, delay: Int, ?args: T) {
    Timer.delay(this.trigger.bind(eventName, args), delay);
  }
  
  /**
   * 
   * @param eventName
   * @param time
   * @param ?args
   */
  public function triggerEach(eventName: String, time: Int, ?args: T) {
    var timer = new Timer(time);
    timer.run = this.trigger.bind(eventName, args);
  }
	
  /**
   * Checks if an event exists
   * 
   * @param eventName
   * @return
   */
	public function exists(eventName: String): Bool {
		return nowMap.exists(eventName);
	}
}

typedef EventMap = GenericEventMap<Dynamic, Void>;