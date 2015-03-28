<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\StationDeskRole;

/**
 * StationDeskRoleSearch represents the model behind the search form about `common\models\StationDeskRole`.
 */
class StationDeskRoleSearch extends StationDeskRole
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['station_desk_role_code', 'station_desk_role_name', 'station_desk_role_description', 'create_time', 'update_time'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = StationDeskRole::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
        ]);

        $query->andFilterWhere(['like', 'station_desk_role_code', $this->station_desk_role_code])
            ->andFilterWhere(['like', 'station_desk_role_name', $this->station_desk_role_name])
            ->andFilterWhere(['like', 'station_desk_role_description', $this->station_desk_role_description]);

        return $dataProvider;
    }
}
