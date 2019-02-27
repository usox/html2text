namespace Usox\Html2Text;

interface Html2TextInterface {

	public function convert(string $html, dict<string, bool> $options = dict[]): string;

	public static function fixNewlines(string $text): string;
}
