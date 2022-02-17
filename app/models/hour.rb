class Hour < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '5分' },
    { id: 3, name: '10分' },
    { id: 4, name: '15分' },
    { id: 5, name: '20分' },
    { id: 6, name: '25分' },
    { id: 7, name: '30分' },
    { id: 8, name: '35分' },
    { id: 9, name: '40分' },
    { id: 10, name: '45分' },
    { id: 11, name: '50分' },
    { id: 12, name: '55分' },
    { id: 13, name: '60分' }
  ]

  include ActiveHash::Associations
  has_many :menus

  end