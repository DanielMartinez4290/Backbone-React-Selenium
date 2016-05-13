import React from "react";

import Title from "./Header/Title";

export default class Header extends React.Component {
  
  handleChange(e) {
    const title = e.target.value;
    this.props.changeTitle(title);
  }

  render() {
    const size = "50";
    return (
      <div>
        <Title title={this.props.title} />
        <input size={size} value={this.props.title} onChange={this.handleChange.bind(this)} />
      </div>
    );
  }
}