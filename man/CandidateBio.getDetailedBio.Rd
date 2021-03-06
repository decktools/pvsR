% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CandidateBio.getDetailedBio.R
\name{CandidateBio.getDetailedBio}
\alias{CandidateBio.getDetailedBio}
\title{Get a candidate's detailed biographical information}
\usage{
CandidateBio.getDetailedBio(candidateId)
}
\arguments{
\item{candidateId}{a character string or list of character strings with the candidate ID(s) (see references for details)}
}
\value{
A list with several data frames containing the elements of CandidateBio.getBio(), and expands upon:\cr bio.candidate.education.degree,\cr bio.candidate.education.field,\cr bio.candidate.education.school,\cr bio.candidate.education.span,\cr bio.candidate.education.gpa,\cr bio.candidate.education.fullText,\cr bio.candidate.profession.title,\cr bio.candidate.profession.organization,\cr bio.candidate.profession.span,\cr bio.candidate.profession.special,\cr bio.candidate.profession.district,\cr bio.candidate.profession.fullText,\cr bio.candidate.political.title,\cr bio.candidate.political.organization,\cr bio.candidate.political.span,\cr bio.candidate.political.special,\cr bio.candidate.political.district,\cr bio.candidate.political.fullText,\cr bio.candidate.congMembership.title,\cr bio.candidate.congMembership.organization,\cr bio.candidate.congMembership.span,\cr bio.candidate.congMembership.special,\cr bio.candidate.congMembership.district,\cr bio.candidate.congMembership.fullText,\cr bio.candidate.orgMembership.title,\cr bio.candidate.orgMembership.organization,\cr bio.candidate.orgMembership.span,\cr bio.candidate.orgMembership.special,\cr bio.candidate.orgMembership.district,\cr bio.candidate.orgMembership.fullText.
}
\description{
This function is a wrapper for the CandidateBio.getDetailedBio() method of the PVS API CandidateBio class which grabs the detailed biographical information for each candidate. The function sends a request with this method to the PVS API for all candidate IDs given as a function input, extracts the XML values from the returned XML file(s) and returns them arranged in one data frame.
}
\examples{
# First, make sure your personal PVS API key is saved as character string in the pvs.key variable:
\dontrun{pvs.key <- "yourkey"}
# get main biographical data on Barack Obama and Mitt Romney
\dontrun{bio <- CandidateBio.getDetailedBio(list(9490,21942))}
\dontrun{head(bio$profession)}
\dontrun{head(bio$orgMembership)}
}
\references{
http://api.votesmart.org/docs/CandidateBio.html\cr 
Use Candidates.getByOfficeState(), Candidates.getByOfficeTypeState(), Candidates.getByLastname(), Candidates.getByLevenshtein(), Candidates.getByElection(), Candidates.getByDistrict() or Candidates.getByZip() to get a list of candidate IDs.\cr
See also: Matter U, Stutzer A (2015) pvsR: An Open Source Interface to Big Data on the American Political Sphere. PLoS ONE 10(7): e0130501. doi: 10.1371/journal.pone.0130501
}
\author{
Ulrich Matter <ulrich.matter-at-unibas.ch>
}
