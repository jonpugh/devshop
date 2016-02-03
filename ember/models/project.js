DevShop.Project = DS.Model.extend({
    name: DS.attr('string'),
    isEnabled: DS.attr('boolean')
});

DevShop.Project.FIXTURES = [
    {
        id: 1,
        name: 'drupal',
        isEnabled: true
    },
    {
        id: 2,
        name: 'hotness',
        isEnabled: false
    },
    {
        id: 3,
        name: 'cool',
        isEnabled: true
    },
];