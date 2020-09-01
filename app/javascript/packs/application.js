import "bootstrap";
import "bootstrap-select";

require('dotenv').config()

import { initOpenTok } from "./lesson";

initOpenTok();

// To move in a separate file
import algoliasearch from "algoliasearch";
import instantsearch from "instantsearch.js";
import { searchBox, hits, currentRefinements, clearRefinements, sortBy, refinementList, pagination, stats } from "instantsearch.js/es/widgets";

const tutors = document.getElementById('tutors');
const algoliaAppId = process.env.ALGOLIA_APP_ID;
const algoliaSearchApiKey = process.env.ALGOLIA_SEARCH_API_KEY;

if (tutors) {
  const searchClient = algoliasearch(algoliaAppId, algoliaSearchApiKey);

  const search = instantsearch({
    indexName: "Tutor_development",
    searchClient,
  });

  search.addWidgets([
    searchBox({
      container: "#searchbox",
      placeholder: "Search for a subject, language, country, currency, tutor's name, ...",
      cssClasses: {
        input: 'input-style'
      }
    }),

    hits({
      container: "#hits",
      templates: {
        item: `
        <a href='tutors/{{id}}' class="tutor-card-link">
          <div class="card tutor-card">
            <img class="card-img-top tutor-card-img" src="https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&ixid=eyJhcHBfaWQiOjE2MTQ1N30" align="left" alt="tutor's photo">
            <div class="card-body tutor-card-body">
              <h4 class="card-title tutor-card-title hit-name">
                {{first_name}}
                {{last_name}}
              </h4>
              <div class="card-text tutor-card-subjects hit-subjects">
                <p>
                  {{#subjects}}
                    <span class="{{name}}">{{name}}</span>
                  {{/subjects}}
                </p>
              </div>
              <div class="tutor-card-info">
                <div class="card-text tutor-card-languages hit-languages">
                  <p>
                    <i class="fas fa-comment"></i>
                    {{#languages}}
                    <span>{{name}}</span>
                    {{/languages}}
                  </p>
                </div>
                <p class="card-text hit-rating">
                  <i class="fas fa-star"></i>
                  {{reviews.average_rating}}
                  ({{reviews.reviews_number}} reviews)
                </p>
              </div>
              <div class="tutor-card-info">
                <p class="card-text hit-country">
                  <i class="fas fa-map-marker-alt"></i>
                  {{country}}
                </p>
                <p class="card-text tutor-card-price hit-price">
                  <span>{{currency}}</span>
                  {{price}} / h
                </p>
              </div>
            </div>
          </div>
        </a>
      `,
      },
      cssClasses: {
        root: 'search-results',
        list: 'tutors-list row',
        item: 'tutor col-12 col-md-6',
      },
    }),

    stats({
      container: "#results-number",
    }),

    currentRefinements({
      container: '#current-filters',
      cssClasses: {
        item: 'filter-tag',
        label: 'dark-blue-color',
        categoryLabel: 'dark-blue-color',
        delete: 'dark-blue-color'
      }
    }),

    clearRefinements({
      container: "#clear-filters",
      templates: {
        resetLabel: 'Clear filters',
      },
      cssClasses: {
        button: 'dark-blue-color'
      }
    }),

    sortBy({
      container: '#sort-by',
      cssClasses: {
        select: 'custom-select'
      },
      items: [
        { label: 'Most relevant', value: 'Tutor_development' },
        // { label: 'Popularity', value: 'Tutor_by_rating_desc_development' },
        { label: 'Price (asc)', value: 'Tutor_by_price_asc_development' },
        { label: 'Price (desc)', value: 'Tutor_by_price_desc_development' },
      ],
    }),

    refinementList({
      container: '#subjects-list',
      attribute: 'subjects.name',
      limit: 3,
      showMore: true,
      templates: {
        showMoreText: `
        {{#isShowingMore}}
          <i class="fas fa-chevron-up"></i>
          less
        {{/isShowingMore}}
        {{^isShowingMore}}
          <i class="fas fa-chevron-down"></i>
          more
        {{/isShowingMore}}
        `,
      },
      cssClasses: {
        showMore: 'more-button',
      }
    }),

    refinementList({
      container: '#languages-list',
      attribute: 'languages.name',
      limit: 3,
      showMore: true,
      templates: {
        showMoreText: `
        {{#isShowingMore}}
          <i class="fas fa-chevron-up"></i>
          less
        {{/isShowingMore}}
        {{^isShowingMore}}
          <i class="fas fa-chevron-down"></i>
          more
        {{/isShowingMore}}
        `,
      },
      cssClasses: {
        showMore: 'more-button',
      }
    }),

    refinementList({
      container: '#countries-list',
      attribute: 'country',
      limit: 3,
      showMore: true,
      templates: {
        showMoreText: `
        {{#isShowingMore}}
          <i class="fas fa-chevron-up"></i>
          less
        {{/isShowingMore}}
        {{^isShowingMore}}
          <i class="fas fa-chevron-down"></i>
          more
        {{/isShowingMore}}
        `,
      },
      cssClasses: {
        showMore: 'more-button',
      }
    }),

    refinementList({
      container: '#currencies-select',
      attribute: 'currency',
      limit: 3,
      showMore: true,
      templates: {
        showMoreText: `
        {{#isShowingMore}}
          <i class="fas fa-chevron-up"></i>
          less
        {{/isShowingMore}}
        {{^isShowingMore}}
          <i class="fas fa-chevron-down"></i>
          more
        {{/isShowingMore}}
        `,
      },
      cssClasses: {
        showMore: 'more-button',
      }
    }),

    pagination({
      container: "#pagination",
      scrollTo: "#hits",
    })

  ]);

  search.start();
}
