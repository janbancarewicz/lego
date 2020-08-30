import { ActionTypes } from "../actionTypes";
import LegoSet from "../../views/Set/LegoSet.model";

export interface SetsState {
    setsList: LegoSet[];
    set: LegoSet | null;
    setBricks: any[];
}

const initialState = {
    setsList: [],
    set: null,
    setBricks: [],
};

const getSetsList = (state, action) => {
    return {
        ...state,
        setsList: action.sets
    }
};

const getSetDetails = (state, action) => {
    return {
        ...state,
        set: action.set
    }
};

const getSetBricksBySetId = (state, action) => {
    return {
        ...state,
        setBricks: action.setBricks
    }
};

const reducer = (state: SetsState = initialState, action) => {
    switch (action.type) {
        case ActionTypes.SET_LIST_GET: return getSetsList(state, action);
        case ActionTypes.SET_DETAILS_GET: return getSetDetails(state, action);
        case ActionTypes.SET_BRICKS_LIST_GET: return getSetBricksBySetId(state, action);
        default: return state;
    }
};

export default reducer;