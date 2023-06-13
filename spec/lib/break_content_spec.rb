require "spec_helper"
require "break_content"

RSpec.describe BreakContent do
  describe "#call" do
    context "when the content is bigger than limit" do
      it "should return the content breaked" do
        content = "In 1991, while studying computer science at University of Helsinki, Linus Torvalds began a project that later became the Linux kernel. He wrote the program specifically for the hardware he was using and independent of an operating system because he wanted to use the functions of his new PC with an 80386 processor. Development was done on MINIX using the GNU C Compiler."
        limit = 40

        expected_result = "In 1991, while studying computer science\nat University of Helsinki, Linus\nTorvalds began a project that later\nbecame the Linux kernel. He wrote the\nprogram specifically for the hardware he\nwas using and independent of an\noperating system because he wanted to\nuse the functions of his new PC with an\n80386 processor. Development was done on\nMINIX using the GNU C Compiler."

        result = described_class.new(content, limit).call

        expect(result).to eq(expected_result)
      end
    end
  end

  context "when the content is less or equal the limit" do
    it "should return the content" do
      content = "In 1991, while studying."
      limit = 40

      expected_result = "In 1991, while studying."

      result = described_class.new(content, limit).call

      expect(result).to eq(expected_result)
    end
  end
end
