namespace Usox\Html2Text;

class Html2TextException extends \Exception {

	public string $more_info;

	public function __construct(string $message = "", string $more_info = "") {
		parent::__construct($message);
		$this->more_info = $more_info;
	}

}
