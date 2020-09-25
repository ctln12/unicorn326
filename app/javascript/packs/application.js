import "bootstrap";
import "bootstrap-select";

require('dotenv').config()

import { initOpentok } from "../plugins/opentok";
import { initAlgoliasearch } from "../plugins/algoliasearch";
import "../plugins/flatpickr";

initOpentok();
initAlgoliasearch();
