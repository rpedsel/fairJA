set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.5156, <2> 45.636, <3> 17.5158, <4> 15.9749, <5> 22.7894, <6> 25.1893, <7> 44.306, <8> 0.3257, <9> 26.7737, <10> 2.1892, <11> 37.7737, <12> 7.9792, <13> 37.9224, <14> 19.8941, <15> 15.9259, <16> 22.3391, <17> 2.5007, <18> 3.9052, <19> 35.9398, <20> 44.7635;
param workload[JOB] := <1> 3.3935, <2> 6.7554, <3> 4.1852, <4> 3.9969, <5> 4.7738, <6> 5.0189, <7> 6.6563, <8> 0.5707, <9> 5.1743, <10> 1.4796, <11> 6.146, <12> 2.8247, <13> 6.1581, <14> 4.4603, <15> 3.9907, <16> 4.7264, <17> 1.5814, <18> 1.9762, <19> 5.995, <20> 6.6906;
param capacity[MACHINE] := <1> 86.554, <2> 86.554, <3> 86.554, <4> 86.554, <5> 86.554, <6> 86.554, <7> 86.554;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
