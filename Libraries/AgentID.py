import pandas as pd


class AgentID:

    def agentid(self):
        df = pd.read_excel('E:/RobotFramework/BIMA-single/agents.xlsx')
        return df['WA ID']

    # def rowscount(self):
    #     df = pd.read_excel('E:/RobotFramework/BIMA-single/agents.xlsx')
    #     return int(df.shape[0])
    #
    # def get_cell_data(self, row, col):
    #     df = pd.read_excel('E:/RobotFramework/BIMA-single/agents.xlsx')
    #     return df.iloc[row, col]


# All_Names = AgentID()
# print((All_Names.agentid()))

# with open("E:/Travel Connect/resources/Inputfile_TravellingConnect_01062019.xml") as f:
#     xml_data = f.read()
#     print(xml_data)
