name := "Scala_tutorials"

version := "0.1"

libraryDependencies  ++= Seq(
  // Last stable release
  "org.scalanlp" %% "breeze" % "0.13.2",
  "org.scalanlp" %% "breeze-natives" % "0.13.2",
  "org.scalanlp" %% "breeze-viz" % "0.13.2"
)
resolvers += "Sonatype Releases" at "https://oss.sonatype.org/content/repositories/releases/"
scalaVersion := "2.12.8"