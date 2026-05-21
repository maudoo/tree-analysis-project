import {
    View,
    Text,
    TouchableOpacity,
    StyleSheet
} from 'react-native';
import { useRouter, useLocalSearchParams } from 'expo-router';

export default function SubmitMission() {
    const router = useRouter();
    const { id, title, points } = useLocalSearchParams();

    return (
        <View style={styles.container}>

            {/* Header */}
            <View style={styles.header}>
                <TouchableOpacity onPress={() => router.back()}>
                    <Text style={styles.back}>← Back</Text>
                </TouchableOpacity>
                <Text style={styles.title}>Submit Mission</Text>
                <Text style={styles.missionName}>{title}</Text>
                <Text style={styles.points}>🌟 {points} pts</Text>
            </View>

            {/* Body */}
            <View style={styles.body}>
                <Text style={styles.question}>How did the mission go?</Text>

                {/* Accomplished button */}
                <TouchableOpacity
                    style={styles.accomplishedButton}
                    onPress={() => router.push({
                        pathname: '/missions/accomplished',
                        params: { title, points }
                    })}>
                    <Text style={styles.accomplishedText}>✅ Accomplished</Text>
                </TouchableOpacity>

                {/* Failure button */}
                <TouchableOpacity
                    style={styles.failureButton}
                    onPress={() => router.push({
                        pathname: '/missions/failure',
                        params: { title }
                    })}>
                    <Text style={styles.failureText}>❌ Failure</Text>
                </TouchableOpacity>
            </View>

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
        marginBottom: 4,
    },
    missionName: {
        fontSize: 16,
        color: '#666',
        marginBottom: 4,
    },
    points: {
        fontSize: 14,
        color: '#2D6A4F',
        fontWeight: '500',
    },
    body: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        padding: 24,
        gap: 16,
    },
    question: {
        fontSize: 20,
        fontWeight: '500',
        color: '#333',
        marginBottom: 24,
    },
    accomplishedButton: {
        width: '100%',
        backgroundColor: '#2D6A4F',
        padding: 20,
        borderRadius: 12,
        alignItems: 'center',
    },
    accomplishedText: {
        color: '#fff',
        fontSize: 18,
        fontWeight: '500',
    },
    failureButton: {
        width: '100%',
        backgroundColor: '#F44336',
        padding: 20,
        borderRadius: 12,
        alignItems: 'center',
    },
    failureText: {
        color: '#fff',
        fontSize: 18,
        fontWeight: '500',
    },
});