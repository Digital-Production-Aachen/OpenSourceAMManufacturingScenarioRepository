using Google.Protobuf;
using ManufacturingScenarioRepository;

public static class ScenarioReaderWriter
{

    public static void WriteDataSet(ManufacturingScenarioDataSet dataSet, string scenarioBaseFolder)
    {
        var name = dataSet.Name;
        if(String.IsNullOrEmpty(name))
            throw new ArgumentNullException("name");
        var dataSetFolder = Path.Combine(scenarioBaseFolder, name);
        var binaryTarget = Path.Combine(dataSetFolder, name + ".scenario");
        var jsonTarget = Path.Combine(dataSetFolder, name + ".json");
        WriteAsBinaryProto(dataSet, binaryTarget);
        WriteAsJSON(dataSet, jsonTarget);
    }

    public static void WriteAsBinaryProto(ManufacturingScenarioDataSet dataSet, string targetFile)
    {
        Directory.CreateDirectory(Directory.GetParent(targetFile).FullName);
        using var outStream = File.OpenWrite(targetFile);
        dataSet.WriteTo(outStream);
    }

    public static void WriteAsJSON(ManufacturingScenarioDataSet dataSet, string targetFile)
    {
        File.WriteAllText(targetFile, dataSet.ToString());
    }

    public static ManufacturingScenarioDataSet ReadFromBinaryProto(string targetFile)
    {
        var dataSet = new ManufacturingScenarioDataSet();
        using var outStream = File.OpenRead(targetFile);
        dataSet.MergeFrom(outStream);
        return dataSet;
    }
}