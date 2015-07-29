<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Order;

/**
 * OrderSearch represents the model behind the search form about `app\models\Order`.
 */
class OrderSearch extends Order
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'charges_id', 'shop_id', 'weight_id', 'size_id', 'timeorder_id', 'levy_id', 'statusorder_id'], 'integer'],
            [['phonenumber', 'address', 'locationx', 'locationy', 'statusCOD', 'note'], 'safe'],
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
        $query = Order::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'id' => $this->id,
            'charges_id' => $this->charges_id,
            'shop_id' => $this->shop_id,
            'weight_id' => $this->weight_id,
            'size_id' => $this->size_id,
            'timeorder_id' => $this->timeorder_id,
            'levy_id' => $this->levy_id,
            'statusorder_id' => $this->statusorder_id,
        ]);

        $query->andFilterWhere(['like', 'phonenumber', $this->phonenumber])
            ->andFilterWhere(['like', 'address', $this->address])
            ->andFilterWhere(['like', 'locationx', $this->locationx])
            ->andFilterWhere(['like', 'locationy', $this->locationy])
            ->andFilterWhere(['like', 'statusCOD', $this->statusCOD])
            ->andFilterWhere(['like', 'note', $this->note]);

        return $dataProvider;
    }
}
