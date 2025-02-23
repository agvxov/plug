class CMDTEST_plug < Cmdtest::Testcase
  def test_error_on_no_arg
    cmd "plug" do
      exit_nonzero
      stdout_equal /.+/
    end
  end

  def test_help
    cmd "plug -h" do
      exit_zero
      stdout_equal /.+/
    end
  end

  def test_simple_unplug
    import_file "test/test_expended.txt", "./"
    expected = [
      "original text",
      "#placeholder<hw> COLLAPSED",
      "some more original text",
    ]

    cmd "plug test_expended.txt -u" do
      changed_files ["test_expended.txt"]
      file_equal "test_expended.txt", expected
      exit_zero
    end
  end

  def test_simple_plug
    import_file "test/test_collapsed.txt", "./"
    expected = [
      "original text",
      "#placeholder<hw> BEGIN",
      "hello world",
      "#placeholder<hw> END",
      "some more original text",
    ]

    cmd "plug test_collapsed.txt -d hw 'hello world' -g" do
      changed_files ["test_collapsed.txt"]
      file_equal "test_collapsed.txt", expected
      exit_zero
    end
  end

  def test_simple_unplug_2
    import_file "test/test2_expended.cpp", "./"
    expected = [
      "#include <stdio.h>",
      "signed main(void){",
      "\t// #placeholder<code> COLLAPSED",
      "\treturn 0;",
      "}",
    ]

    cmd "plug test2_expended.cpp -u" do
      changed_files ["test2_expended.cpp"]
      file_equal "test2_expended.cpp", expected
      exit_zero
    end
  end

  def test_simple_plug_2
    import_file "test/test2_collapsed.cpp", "./"
    expected = [
      "#include <stdio.h>",
      "signed main(void){",
      "\t// #placeholder<code> COLLAPSED",
      "\treturn 0;",
      "}",
    ]

    cmd "plug test2_collapsed.cpp -d code '\tputs(\"hello world\")' -g" do
      changed_files ["test2_collapsed.cpp"]
      file_equal "test2_collapsed.cpp", expected
      exit_zero
    end
  end
end
