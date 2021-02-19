import Cocoa
import CreateML

//MLData table accepts JSON and CSV
let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/priteshnadiadhara/Documents/Projects/Stalks/NLPModel/twitter-sanders.csv"))

// randomSplit Made for CreateML with by representing % of data used for training data and left over used for testing data
// Seed used to repeat randomization
let(trainingData, testingData) = data.randomSplit(by: 0.8, seed: 5)

// text and label come from csv
// trendClassifier is our trained ML model from dataTable
let trendClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = trendClassifier.evaluation(on: data, textColumn: "text", labelColumn: "class")

// Currently returns a 90% + accuracy return
let evaluationAccuary = (1.0 - evaluationMetrics.classificationError) * 100

let metaData = MLModelMetadata(author: "Pritesh", shortDescription: "Model built off of evaluated tweets of stocks", version: "1.0")

// export model
try trendClassifier.write(to: URL(fileURLWithPath: "/Users/priteshnadiadhara/Documents/Projects/Stalks/NLPModel/TwitterTrendClassifier.mlmodel"))


// Test out MLModel

try trendClassifier.prediction(from: "uro format, best format")

try trendClassifier.prediction(from: "could it be possible to be this unlucky? @life")

try trendClassifier.prediction(from: "yesterday is tomorrow")

try trendClassifier.prediction(from: "hodl for dear life @bitcoin")
