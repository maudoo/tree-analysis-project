import { View, Text, ScrollView, Image, StyleSheet } from 'react-native';

const LEVELS = [
    { level: 1, name: 'Seedling',    xp: 0,    image: require('@/assets/images/Alphahawk_Level1.png') },
    { level: 2, name: 'Sprout',      xp: 100,  image: require('@/assets/images/Alphahawk_Level2.png') },
    { level: 3, name: 'Sapling',     xp: 250,  image: require('@/assets/images/Alphahawk_Level3.png') },
    { level: 4, name: 'Budding',     xp: 500,  image: require('@/assets/images/Alphahawk_Level4.png') },
    { level: 5, name: 'Rooted',      xp: 1000, image: require('@/assets/images/Alphahawk_Level5.png') },
    { level: 6, name: 'Branching',   xp: 2000, image: require('@/assets/images/Alphahawk_Level6.png') },
    { level: 7, name: 'Canopy',      xp: 3500, image: require('@/assets/images/Alphahawk_Level7.png') },
    { level: 8, name: 'Ancient Oak', xp: 5000, image: require('@/assets/images/Alphahawk_Level8.png') },
];

const CURRENT_XP = 375;
const CURRENT_LEVEL = 3;

export default function Level() {
    const currentLevel = LEVELS[CURRENT_LEVEL - 1];
    const nextLevel = LEVELS[CURRENT_LEVEL];
    const xpForNext = nextLevel ? nextLevel.xp - currentLevel.xp : 0;
    const xpProgress = CURRENT_XP - currentLevel.xp;
    const progressPercent = Math.min((xpProgress / xpForNext) * 100, 100);

    return (
        <ScrollView style={styles.container}>

            {/* Current level card */}
            <View style={styles.currentCard}>
                <Image
                    source={currentLevel.image}
                    style={styles.currentImage}
                    resizeMode="contain"
                />
                <Text style={styles.currentLevel}>Level {currentLevel.level}</Text>
                <Text style={styles.currentName}>{currentLevel.name}</Text>
                <Text style={styles.currentXP}>{CURRENT_XP} XP</Text>

                {nextLevel && (
                    <View style={styles.progressContainer}>
                        <View style={styles.progressBar}>
                            <View style={[styles.progressFill, { width: `${progressPercent}%` }]} />
                        </View>
                        <Text style={styles.progressLabel}>
                            {xpProgress} / {xpForNext} XP to {nextLevel.name}
                        </Text>
                    </View>
                )}

                {!nextLevel && (
                    <Text style={styles.maxLevel}>🏆 Max Level Reached!</Text>
                )}
            </View>

            {/* All levels list */}
            <Text style={styles.sectionTitle}>All Levels</Text>

            {LEVELS.map(lvl => {
                const isCompleted = lvl.level < CURRENT_LEVEL;
                const isCurrent = lvl.level === CURRENT_LEVEL;
                const isLocked = lvl.level > CURRENT_LEVEL;

                return (
                    <View
                        key={lvl.level}
                        style={[
                            styles.levelRow,
                            isCurrent && styles.levelRowCurrent,
                            isCompleted && styles.levelRowCompleted,
                        ]}>

                        {/* Avatar */}
                        <Image
                            source={lvl.image}
                            style={[
                                styles.avatar,
                                isLocked && styles.avatarLocked
                            ]}
                            resizeMode="contain"
                        />

                        {/* Info */}
                        <View style={styles.levelInfo}>
                            <Text style={[
                                styles.levelName,
                                isLocked && styles.lockedText,
                            ]}>
                                Level {lvl.level} — {lvl.name}
                            </Text>
                            <Text style={styles.levelXP}>{lvl.xp} XP required</Text>
                        </View>

                        {/* Status */}
                        {isCompleted && <Text style={styles.done}>✅</Text>}
                        {isCurrent && <Text style={styles.current}>▶</Text>}
                        {isLocked && <Text style={styles.locked}>🔒</Text>}

                    </View>
                );
            })}

        </ScrollView>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#f9f9f9',
    },
    currentCard: {
        backgroundColor: '#2D6A4F',
        margin: 16,
        borderRadius: 16,
        padding: 24,
        alignItems: 'center',
    },
    currentImage: {
        width: 120,
        height: 120,
        marginBottom: 16,
    },
    currentLevel: {
        fontSize: 16,
        color: '#a8d5b5',
        marginBottom: 4,
    },
    currentName: {
        fontSize: 28,
        fontWeight: '500',
        color: '#fff',
        marginBottom: 8,
    },
    currentXP: {
        fontSize: 18,
        color: '#a8d5b5',
        marginBottom: 16,
    },
    progressContainer: {
        width: '100%',
        gap: 8,
    },
    progressBar: {
        width: '100%',
        height: 12,
        backgroundColor: 'rgba(255,255,255,0.2)',
        borderRadius: 6,
        overflow: 'hidden',
    },
    progressFill: {
        height: '100%',
        backgroundColor: '#fff',
        borderRadius: 6,
    },
    progressLabel: {
        color: '#a8d5b5',
        fontSize: 13,
        textAlign: 'center',
    },
    maxLevel: {
        color: '#fff',
        fontSize: 18,
        fontWeight: '500',
    },
    sectionTitle: {
        fontSize: 18,
        fontWeight: '500',
        color: '#333',
        paddingHorizontal: 16,
        paddingBottom: 8,
    },
    levelRow: {
        flexDirection: 'row',
        alignItems: 'center',
        backgroundColor: '#fff',
        marginHorizontal: 16,
        marginBottom: 8,
        padding: 16,
        borderRadius: 12,
        borderWidth: 1,
        borderColor: '#eee',
        gap: 12,
    },
    levelRowCurrent: {
        borderColor: '#2D6A4F',
        borderWidth: 2,
    },
    levelRowCompleted: {
        opacity: 0.7,
    },
    avatar: {
        width: 48,
        height: 48,
    },
    avatarLocked: {
        opacity: 0.3,
    },
    levelInfo: {
        flex: 1,
    },
    levelName: {
        fontSize: 16,
        fontWeight: '500',
        color: '#333',
        marginBottom: 4,
    },
    levelXP: {
        fontSize: 13,
        color: '#888',
    },
    lockedText: {
        color: '#aaa',
    },
    done: {
        fontSize: 20,
    },
    current: {
        fontSize: 20,
        color: '#2D6A4F',
    },
    locked: {
        fontSize: 20,
    },
});