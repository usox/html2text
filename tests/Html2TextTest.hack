namespace Usox\Html2Text;

use function Facebook\FBExpect\expect;
use type Facebook\HackTest\HackTest;

class Html2TextTest extends HackTest {

	private function doTest(
		string $test,
		dict<string, bool> $options = dict[]
	): void {
		$this->doTestWithResults($test, $test, $options);
	}

	private function doTestWithResults(
		string $test,
		string $result,
		dict<string, bool> $options
	): void {

		expect(
			\file_exists(__DIR__ . "/$test.html")
		)->toBeTrue();

		expect(
			\file_exists(__DIR__ . "/$result.txt")
		)->toBeTrue();
		
		$input = \file_get_contents(__DIR__ . "/$test.html");
		$expected = Html2Text::fixNewlines(\file_get_contents(__DIR__ . "/$result.txt"));

		$converter = new Html2Text();
		$output = $converter->convert($input, $options);

		if ($output !== $expected) {
			\file_put_contents(__DIR__ . "/$result.output", $output);
		}

		expect(
			$output
		)->toBeSame($expected);
	}

	public function testBasic(): void {
		$this->doTest("basic");
	}

	public function testAnchors(): void {
		$this->doTest("anchors");
	}

	public function testMoreAnchors(): void {
		$this->doTest("more-anchors");
	}

	public function test3(): void {
		$this->doTest("test3");
	}

	public function test4(): void {
		$this->doTest("test4");
	}

	public function testTable(): void {
		$this->doTest("table");
	}

	public function testNbsp(): void {
		$this->doTest("nbsp");
	}

	public function testLists(): void {
		$this->doTest("lists");
	}

	public function testPre(): void {
		$this->doTest("pre");
	}

	public function testNewLines(): void {
		$this->doTest("newlines");
	}

	public function testNestedDivs(): void {
		$this->doTest("nested-divs");
	}

	public function testBlockQuotes(): void {
		$this->doTest("blockquotes");
	}

	public function testFullEmail(): void {
		$this->doTest("full_email");
	}

	public function testImages(): void {
		$this->doTest("images");
	}

	public function testNonBreakingSpaces(): void {
		$this->doTest("non-breaking-spaces");
	}

	public function testUtf8Example(): void {
		$this->doTest("utf8-example");
	}

	public function testWindows1252Example(): void {
		$this->doTest("windows-1252-example");
	}

	public function testMsoffice(): void {
		$this->doTest("msoffice");
	}

	public function testDOMProcessing(): void {
		$this->doTest("dom-processing");
	}

	public function testEmpty(): void {
		$this->doTest("empty");
	}

	public function testHugeMsoffice(): void {
		$this->doTest("huge-msoffice");
	}

	public function testZeroWidthNonJoiners(): void {
		$this->doTest("zero-width-non-joiners");
	}

	public function testInvalidXMLIgnore(): void {
		$this->doTest("invalid", dict['ignore_errors' => true]);
	}

	public function testInvalidOption(): void {
		expect(
			() ==> $this->doTest("basic", dict['invalid_option' => true])
		)->toThrow(
			\InvalidArgumentException::class
		);
	}

	public function testBasicDropLinks(): void {
		$this->doTestWithResults("basic", "basic.no-links", dict['drop_links' => true]);
	}

	public function testAnchorsDropLinks(): void {
		$this->doTestWithResults("anchors", "anchors.no-links", dict['drop_links' => true]);
	}

}
