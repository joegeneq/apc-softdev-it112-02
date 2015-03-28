<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\EmployeeHasStationDesk;

/**
 * EmployeeHasStationDeskSearch represents the model behind the search form about `common\models\EmployeeHasStationDesk`.
 */
class EmployeeHasStationDeskSearch extends EmployeeHasStationDesk
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'employee_id', 'station_desk_id', 'station_desk_role_id'], 'integer'],
            [['created_time', 'update_time'], 'safe'],
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
        $query = EmployeeHasStationDesk::find();

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
            'employee_id' => $this->employee_id,
            'station_desk_id' => $this->station_desk_id,
            'station_desk_role_id' => $this->station_desk_role_id,
            'created_time' => $this->created_time,
            'update_time' => $this->update_time,
        ]);

        return $dataProvider;
    }
}
