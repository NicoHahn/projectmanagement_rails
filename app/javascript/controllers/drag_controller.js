// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  connect() {
    console.log("test1");
    this.sortable = Sortable.create(this.element, {
      group: 'shared',
      onEnd: this.end.bind(this)
    })
    new Sortable(planned, {
      group: 'shared', // set both lists to same group
      animation: 150
    });
    new Sortable(to_do, {
      group: 'shared', // set both lists to same group
      animation: 150
    });
    new Sortable(in_progress, {
      group: 'shared', // set both lists to same group
      animation: 150
    });
    new Sortable(in_review, {
      group: 'shared', // set both lists to same group
      animation: 150
    });
    new Sortable(approved, {
      group: 'shared', // set both lists to same group
      animation: 150
    });
    new Sortable(done, {
      group: 'shared', // set both lists to same group
      animation: 150
    });
  }
  end(event) {
    console.log(this.element);
  }
}
