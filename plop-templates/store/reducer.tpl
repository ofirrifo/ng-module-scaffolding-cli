import * as {{pascalCase targetFolder}}Actions from './{{targetFolder}}.actions';

export interface State {
  {{camelCase targetFolder}}: any;
}

const initialState: State = {
  {{camelCase targetFolder}}: void 0,
};

export function reducer(state: State = initialState, action: {{pascalCase targetFolder}}Actions.Actions): State {
  switch (action.type) {
    default: {
      return state;
    }
  }
}
