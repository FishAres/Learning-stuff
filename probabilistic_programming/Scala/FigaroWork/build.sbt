import sbt._
import Keys._

  lazy val figaroWorkSettings =  Seq(
    scalaVersion := "2.12.2",
    retrieveManaged := true
  )

  lazy val figaroWork = Project("FigaroWork", file("."))
    .settings(figaroWorkSettings)
    .settings (scalacOptions ++= Seq(
	"-feature",
	"-language:existentials",
	"-deprecation",
	"-language:postfixOps"
    ))
    .settings(libraryDependencies ++= Seq(
      "com.cra.figaro" %% "figaro" % "latest.release",
      "com.stripe" %% "rainier-core" %% "0.1.1",
      "com.cibo" %% "evilplot" % "0.4.1"
      
    ))
