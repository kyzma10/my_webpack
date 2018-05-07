import template from "raw-loader!./home.html";
import { renderFragment } from "../../utils/render";
import './home.scss';
import $ from 'jquery';

$(document).ready(function () {
  $('.slider > ul > li:gt(0)').hide();

  $('.slider__arrow-right > i').on('click', function() {

    $('.slider > ul > li:first')
    .fadeOut(500)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('.slider > ul');
  })
});


export function render(container) {
  renderFragment(container, template);
}
