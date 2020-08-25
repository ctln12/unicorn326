import "bootstrap";
import "bootstrap-select";
import { initOpenTok } from "./lesson";
import algoliasearch from "algoliasearch";

require('dotenv').config()

initOpenTok();

const tutors = document.getElementById('tutors');
if (tutors) {
  var client = algoliasearch("11UNBLSZP5", "1beb4d87ba411f5793a0645f224e90ce");
  var index = client.initIndex("Tutor");
  // index
  //   .search("Deandre", { hitsPerPage: 10, page: 0 })
  //   .then(function searchDone(content) {
  //     console.log(content);
  //   })
  //   .catch(function searchFailure(err) {
  //     console.error(err);
  //   });
}
