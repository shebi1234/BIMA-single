import pandas as pd


class Name:
    def agentname(self):
        df = pd.read_excel('E:/RobotFramework/BIMA-single/agents.xlsx')
        return df['Name']


# All_Names = Name()
# print((All_Names.agentname()))
