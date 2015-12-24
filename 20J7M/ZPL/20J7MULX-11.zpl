set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.7651, <2> 46.4494, <3> 12.986, <4> 37.9182, <5> 26.5174, <6> 40.3195, <7> 25.3037, <8> 24.7063, <9> 48.2094, <10> 49.3628, <11> 33.6834, <12> 22.9539, <13> 21.8469, <14> 2.6969, <15> 28.9418, <16> 15.2159, <17> 22.3785, <18> 24.8188, <19> 9.88, <20> 24.7616;
param workload[JOB] := <1> 5.3633, <2> 6.8154, <3> 3.6036, <4> 6.1578, <5> 5.1495, <6> 6.3498, <7> 5.0303, <8> 4.9705, <9> 6.9433, <10> 7.0259, <11> 5.8037, <12> 4.791, <13> 4.6741, <14> 1.6422, <15> 5.3798, <16> 3.9008, <17> 4.7306, <18> 4.9818, <19> 3.1432, <20> 4.9761;
param capacity[MACHINE] := <1> 14.4904, <2> 14.4904, <3> 14.4904, <4> 14.4904, <5> 14.4904, <6> 14.4904, <7> 14.4904;

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
