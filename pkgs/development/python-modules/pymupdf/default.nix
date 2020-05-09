{ stdenv, buildPythonPackage, fetchPypi, mupdf, swig }:
buildPythonPackage rec {
  pname = "PyMuPDF";
  version = "1.16.18";

  src = fetchPypi {
    inherit pname version;
    sha256 = "334747e49fe79f0814ea826ba86c52773619e354a35a6333e986f12759adec3e";
  };

  patchPhase = ''
    substituteInPlace setup.py \
        --replace '/usr/include/mupdf' ${mupdf.dev}/include/mupdf
    '';
  nativeBuildInputs = [ swig ];
  buildInputs = [ mupdf ];

  doCheck = false;

  meta = with stdenv.lib; {
    description = "Python bindings for MuPDF's rendering library.";
    homepage = "https://github.com/pymupdf/PyMuPDF";
    maintainers = with maintainers; [ teto ];
    license =  licenses.agpl3;
    platforms = platforms.linux;
  };
}
