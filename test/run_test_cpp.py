from KratosMultiphysics import *
from KratosMultiphysics.FluidDynamicsApplication import *
from KratosMultiphysics import Tester

Tester.SetVerbosity(Tester.Verbosity.TESTS_OUTPUTS)

# Tester.RunTestCases('TestFluidCharacteristicNumbersCalculateElementCFLWithSoundVelocity*')
# Tester.RunTestCases('TestEstimateDtUtilitiesEstimateDtCompressibleFlow*')
Tester.RunTestSuite('FluidDynamicsApplicationFastSuite')
