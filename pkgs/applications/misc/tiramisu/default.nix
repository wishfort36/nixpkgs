{ lib, stdenv, fetchFromGitHub, pkg-config, glib }:

stdenv.mkDerivation rec {
  pname = "tiramisu";
  version = "unstable-2021-05-18";

  src = fetchFromGitHub {
    owner = "Sweets";
    repo = pname;
    rev = "2b8164659410164e0b9cda6c1c6612b266d6a7c6";
    sha256 = "sha256-NbrDGx9IUoArlXoqCrCHsAya3DLcgszLpiCN5fU4Ogk=";
  };

  buildInputs = [ glib ];

  nativeBuildInputs = [ pkg-config ];

  makeFlags = [ "PREFIX=$(out)" ];

  meta = with lib; {
    description = "Desktop notifications, the UNIX way";
    longDescription = ''
      tiramisu is a notification daemon based on dunst that outputs notifications
      to STDOUT in order to allow the user to process notifications any way they
      prefer.
    '';
    homepage = "https://github.com/Sweets/tiramisu";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ wishfort36 fortuneteller2k ];
  };
}
