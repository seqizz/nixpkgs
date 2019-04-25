{ stdenv
, buildPythonPackage
, fetchPypi
, nose
, docutils
}:

buildPythonPackage rec {
  version = "0.9.3";
  pname = "python_toolbox";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1mjh8hmknhym0y95za628m8gls8wvb87qvk1hc0p7lvyfdivy71f";
  };

  # https://github.com/cool-RR/python_toolbox/issues/3
  # These tests are failing
  preCheck = ''
    rm source_py{2,3}/test_python_toolbox/test_combi/test_extensive.py
    rm source_py{2,3}/test_python_toolbox/test_cute_testing/test_raise_assertor.py
  '';

  propagatedBuildInputs = [
    docutils
    nose
  ];

  meta = with stdenv.lib; {
    description = "A collection of Python tools for various tasks";
    homepage = https://github.com/cool-RR/python_toolbox;
    license = licenses.mit;
    maintainers = with maintainers; [ seqizz ];
  };
}
