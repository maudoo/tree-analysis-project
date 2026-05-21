import {
    View,
    Text,
    FlatList,
    TouchableOpacity,
    StyleSheet
} from 'react-native';
import { useRouter } from 'expo-router';

const DUMMY_MISSIONS = [
    {
        id: 1,
        title: 'Find the Old Oak',
        description: 'Locate and photograph the 200 year old Oak tree in the north park.',
        difficulty: 'Easy',
        points: 100,
    },
    {
        id: 2,
        title: 'Elm Hunter',
        description: 'Find 3 Elm trees within 1km of your location.',
        difficulty: 'Medium',
        points: 250,
    },
    {
        id: 3,
        title: 'Rare Pine Quest',
        description: 'Track down the rare White Pine hidden deep in the arboretum.',
        difficulty: 'Hard',
        points: 500,
    },
    {
        id: 4,
        title: 'Maple Trail',
        description: 'Photograph 5 different Maple trees along the trail.',
        difficulty: 'Medium',
        points: 300,
    },
];

const DIFFICULTY_COLORS: Record<string, string> = {
    Easy:   '#4CAF50',
    Medium: '#FF9800',
    Hard:   '#F44336',
};

export default function AssignMission() {
    const router = useRouter();

    const handleAccept = (mission: typeof DUMMY_MISSIONS[0]) => {
        router.push({
            pathname: '/missions/submit',
            params: {
                id: mission.id,
                title: mission.title,
                points: mission.points,
            },
        });
    };

    return (
        <View style={styles.container}>

            {/* Header */}
            <View style={styles.header}>
                <TouchableOpacity onPress={() => router.back()}>
                    <Text style={styles.back}>← Back</Text>
                </TouchableOpacity>
                <Text style={styles.title}>Available Missions</Text>
            </View>

            {/* Mission List */}
            <FlatList
                data={DUMMY_MISSIONS}
                keyExtractor={item => item.id.toString()}
                contentContainerStyle={styles.list}
                renderItem={({ item }) => (
                    <View style={styles.card}>

                        {/* Top row — title + difficulty badge */}
                        <View style={styles.cardHeader}>
                            <Text style={styles.missionTitle}>{item.title}</Text>
                            <View style={[
                                styles.badge,
                                { backgroundColor: DIFFICULTY_COLORS[item.difficulty] }
                            ]}>
                                <Text style={styles.badgeText}>{item.difficulty}</Text>
                            </View>
                        </View>

                        {/* Description */}
                        <Text style={styles.description}>{item.description}</Text>

                        {/* Bottom row — points + accept button */}
                        <View style={styles.cardFooter}>
                            <Text style={styles.points}>🌟 {item.points} pts</Text>
                            <TouchableOpacity
                                style={styles.acceptButton}
                                onPress={() => handleAccept(item)}>
                                <Text style={styles.acceptText}>Accept</Text>
                            </TouchableOpacity>
                        </View>

                    </View>
                )}
            />
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#f9f9f9',
    },
    header: {
        padding: 24,
        paddingTop: 60,
        backgroundColor: '#fff',
        borderBottomWidth: 1,
        borderBottomColor: '#eee',
    },
    back: {
        fontSize: 16,
        color: '#2D6A4F',
        marginBottom: 8,
    },
    title: {
        fontSize: 24,
        fontWeight: '500',
        color: '#333',
    },
    list: {
        padding: 16,
        gap: 12,
    },
    card: {
        backgroundColor: '#fff',
        borderRadius: 12,
        padding: 16,
        borderWidth: 1,
        borderColor: '#eee',
    },
    cardHeader: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        marginBottom: 8,
    },
    missionTitle: {
        fontSize: 18,
        fontWeight: '500',
        color: '#333',
        flex: 1,
    },
    badge: {
        paddingHorizontal: 10,
        paddingVertical: 4,
        borderRadius: 20,
        marginLeft: 8,
    },
    badgeText: {
        color: '#fff',
        fontSize: 12,
        fontWeight: '500',
    },
    description: {
        fontSize: 14,
        color: '#666',
        lineHeight: 20,
        marginBottom: 16,
    },
    cardFooter: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
    },
    points: {
        fontSize: 16,
        color: '#2D6A4F',
        fontWeight: '500',
    },
    acceptButton: {
        backgroundColor: '#2D6A4F',
        paddingHorizontal: 20,
        paddingVertical: 8,
        borderRadius: 8,
    },
    acceptText: {
        color: '#fff',
        fontWeight: '500',
        fontSize: 14,
    },
});