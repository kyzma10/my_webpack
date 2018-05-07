import template from "raw-loader!./login.html";
import { renderFragment } from "../../utils/render";
import './login.scss';

export function render(container) {
  renderFragment(container, template);
}
