const bcrypt = require("bcrypt");

const main = async () => {
  const password = process.argv[2];

  const salt = await bcrypt.genSalt(10);

  const hashedPass = await bcrypt.hash(password, salt);

  return hashedPass;
};

main().then((text) => console.log(text));
