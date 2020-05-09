{ stdenv
, buildPythonPackage
, fetchPypi
, ruamel_yaml
, xmltodict
, pygments
, isPy27
}:

buildPythonPackage rec {
  pname = "jc";
  version = "1.10.9";
  disabled = isPy27;

  src = fetchPypi {
    inherit pname version;
    sha256 = "2cc6dfb0dcc629e120c1b74d6bc6bf4f0213d7d1c6269277707ce4914a8edfc2";
  };

  propagatedBuildInputs = [ ruamel_yaml xmltodict pygments ];

  meta = with stdenv.lib; {
    description = "This tool serializes the output of popular command line tools and filetypes to structured JSON output.";
    homepage = "https://github.com/kellyjonbrazil/jc";
    license = licenses.mit;
    maintainers = with maintainers; [ atemu ];
  };
}
