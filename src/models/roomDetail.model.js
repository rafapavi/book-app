const RoomDetailModel = (sequelize, DataTypes) => {
  return sequelize.define(
    "room_detail",
    {
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
      },
      name: {
        type: DataTypes.STRING,
      },
      description: {
        type: DataTypes.STRING,
      },
      noOfBeds: {
        type: DataTypes.INTEGER,
      },
      roomType: {
        type: DataTypes.CHAR,
      },
      createdBy: {
        type: DataTypes.INTEGER,
      },
      updatedBy: {
        type: DataTypes.INTEGER,
      },
    },
    {
      tableName: "room_detail",
      timestamps: true,
    }
  );
};

export default RoomDetailModel;
