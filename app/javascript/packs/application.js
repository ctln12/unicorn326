import "bootstrap";
import "bootstrap-select";

require('dotenv').config()

import { initOpenTok } from "./lesson";
import { initAlgoliasearch } from "../plugins/algoliasearch";
import "../plugins/flatpickr";

initOpenTok();
initAlgoliasearch();
