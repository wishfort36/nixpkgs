{ stdenv, buildPythonPackage, fetchPypi, flask, events
, pymongo, simplejson, cerberus, werkzeug }:

buildPythonPackage rec {
  pname = "Eve";
  version = "1.0.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "a473da3b3ba193528f6f6bfc4bba3787a3bb178798179642ee30fc857f5a5c4f";
  };

  propagatedBuildInputs = [
    cerberus
    events
    flask
    pymongo
    simplejson
    werkzeug
  ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "werkzeug==0.15.4" "werkzeug"
  '';

  # tests call a running mongodb instance
  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://python-eve.org/";
    description = "Open source Python REST API framework designed for human beings";
    license = licenses.bsd3;
    maintainers = [ maintainers.marsam ];
  };
}
