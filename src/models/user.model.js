const UserModel = (sequelize, DataTypes) => {
  return sequelize.define(
    "user",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      firstName: {
        type: DataTypes.STRING,
      },
      lastName: {
        type: DataTypes.STRING,
      },
      email: {
        type: DataTypes.STRING,
      },
      password: {
        type: DataTypes.STRING,
      },
      passport: {
        type: DataTypes.STRING,
      },
      passportExpiry: {
        type: DataTypes.DATE,
      },
      updatedBy: {
        type: DataTypes.INTEGER,
      },
    },
    {
      tableName: "user",
      timestamps: true,
    }
  );
};

export default UserModel;
