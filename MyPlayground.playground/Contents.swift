import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/jaime/Downloads/twitter-sanders-apple3.csv"))
let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

let classifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")
let evaluation = classifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")
let accuracy = (1.0 - evaluation.classificationError) * 100

let metadata = MLModelMetadata(author: "Jaime Escobar", shortDescription: "A tweets text emotion recognition", version: "1.0")
try classifier.write(to: URL(fileURLWithPath: "/Users/jaime/Downloads/TweetsClassifier.mlmodel"))

try classifier.prediction(from: "@Apple is terrible")
try classifier.prediction(from: "I'm Mexican")
try classifier.prediction(from: "I love to work at @IBM")
