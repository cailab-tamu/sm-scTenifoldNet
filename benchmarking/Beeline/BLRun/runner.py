import BLRun.scodeRunner as SCODE
import BLRun.scnsRunner as SCNS
import BLRun.sinceritiesRunner as SINCERITIES
import BLRun.pidcRunner as PIDC
import BLRun.grnvbemRunner as GRNVBEM
import BLRun.genie3Runner as GENIE3
import BLRun.grnboost2Runner as GRNBOOST2
import BLRun.leapRunner as LEAP
import BLRun.jump3Runner as JUMP3
import BLRun.ppcorRunner as PPCOR
import BLRun.grisliRunner as GRISLI
import BLRun.scingeRunner as SCINGE
import BLRun.scribeRunner as SCRIBE
import BLRun.sctenifoldnetRunner as SCTENIFOLDNET


from pathlib import Path


InputMapper = {'SCODE':SCODE.generateInputs,
               'SINCERITIES':SINCERITIES.generateInputs,
               'SCNS':SCNS.generateInputs,
               'PIDC':PIDC.generateInputs,
               'GRNVBEM':GRNVBEM.generateInputs,
               'GENIE3':GENIE3.generateInputs,
               'GRNBOOST2':GRNBOOST2.generateInputs,
               'LEAP':LEAP.generateInputs,
               'JUMP3':JUMP3.generateInputs,
               'PPCOR':PPCOR.generateInputs,
               'GRISLI':GRISLI.generateInputs,
               'SCINGE':SCINGE.generateInputs,
               'SCRIBE':SCRIBE.generateInputs,
               'SCTENIFOLDNET':SCTENIFOLDNET.generateInputs}


AlgorithmMapper = {'SCODE':SCODE.run,
            'SINCERITIES':SINCERITIES.run,
            'SCNS':SCNS.run,
            'PIDC':PIDC.run,
            'GRNVBEM':GRNVBEM.run,
            'GENIE3':GENIE3.run,
            'GRNBOOST2':GRNBOOST2.run,
            'LEAP':LEAP.run,
            'JUMP3':JUMP3.run,
            'PPCOR':PPCOR.run,
            'GRISLI':GRISLI.run,
            'SCINGE':SCINGE.run,
            'SCRIBE':SCRIBE.run,
	    'SCTENIFOLDNET':SCTENIFOLDNET.run}


OutputParser = {'SCODE':SCODE.parseOutput,
            'SINCERITIES':SINCERITIES.parseOutput,
            'SCNS':SCNS.parseOutput,
            'PIDC':PIDC.parseOutput,
            'GRNVBEM':GRNVBEM.parseOutput,
            'GENIE3':GENIE3.parseOutput,
            'GRNBOOST2':GRNBOOST2.parseOutput,
            'LEAP': LEAP.parseOutput,
            'JUMP3': JUMP3.parseOutput,
            'PPCOR':PPCOR.parseOutput,
            'GRISLI':GRISLI.parseOutput,
            'SCINGE':SCINGE.parseOutput,
            'SCRIBE':SCRIBE.parseOutput,
	    'SCTENIFOLDNET':SCTENIFOLDNET.parseOutput}



class Runner(object):
    '''
    A runnable analysis to be incorporated into the pipeline
    '''
    def __init__(self,
                params):
        self.name = params['name']
        self.inputDir = params['inputDir']
        self.params = params['params']
        self.exprData = params['exprData']
        self.cellData = params['cellData']
        
    def generateInputs(self):
        InputMapper[self.name](self)
        
        
    def run(self):
        AlgorithmMapper[self.name](self)


    def parseOutput(self):
        OutputParser[self.name](self)
