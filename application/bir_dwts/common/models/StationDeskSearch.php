<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\StationDesk;

/**
 * StationDeskSearch represents the model behind the search form about `common\models\StationDesk`.
 */
class StationDeskSearch extends StationDesk
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['section_id','station_desk_code', 'station_desk_name', 'station_desk_notes', 'create_time', 'update_time'], 'safe'],
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
        $query = StationDesk::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->joinWith('section');

        $query->andFilterWhere([
            'id' => $this->id,
            'create_time' => $this->create_time,
            'update_time' => $this->update_time,
        ]);

        $query->andFilterWhere(['like', 'station_desk_code', $this->station_desk_code])
            ->andFilterWhere(['like', 'station_desk_name', $this->station_desk_name])
            ->andFilterWhere(['like', 'station_desk_notes', $this->station_desk_notes])
            ->andFilterWhere(['like', 'section.section_name', $this->section_id]);

        return $dataProvider;
    }
}
