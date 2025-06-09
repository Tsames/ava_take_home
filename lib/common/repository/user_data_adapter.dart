import 'package:hive/hive.dart';

import '../employment_type.dart';
import '../pay_frequency.dart';
import '../user_data.dart';

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 1;

  @override
  UserData read(BinaryReader reader) {
    return UserData(
      employmentType: EmploymentType.values[reader.readByte()],
      employer: reader.readString(),
      jobTitle: reader.readString(),
      salary: reader.readInt(),
      payFrequency: PayFrequency.values[reader.readByte()],
      isDirectDeposit: reader.readBool(),
      employerAddress: reader.readString(),
      nextPayDay: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
      yearsWithEmployer: reader.readInt(),
      monthsWithEmployer: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer.writeByte(obj.employmentType?.index ?? 0); // Handle nullable employmentType
    writer.writeString(obj.employer ?? ''); // Handle nullable employer
    writer.writeString(obj.jobTitle ?? ''); // Handle nullable jobTitle
    writer.writeInt(obj.salary ?? 0); // Handle nullable salary
    writer.writeByte(obj.payFrequency?.index ?? 0); // Handle nullable payFrequency
    writer.writeBool(obj.isDirectDeposit ?? false); // Handle nullable isDirectDeposit
    writer.writeString(obj.employerAddress ?? ''); // Handle nullable employerAddress
    writer.writeInt(obj.nextPayDay?.millisecondsSinceEpoch ?? 0); // Handle nullable nextPayDay
    writer.writeInt(obj.yearsWithEmployer ?? 0); // Handle nullable yearsWithEmployer
    writer.writeInt(obj.monthsWithEmployer ?? 0); // Handle nullable monthsWithEmployer
  }
}
